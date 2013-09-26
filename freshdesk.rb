# Enter your freshdesk url and api key.
FRESHDESK_URL = 'example.freshdesk.com'
FRESHDESK_VIEW_URL = '/helpdesk/tickets.json?filter_name=all_tickets'
FRESHDESK_USERNAME = 'SECRET_API_KEY'
# Password is blank
FRESHDESK_PASSWORD = ''
FRESHDESK_IGNORE_USERS = ['No Agent', ]


SCHEDULER.every '60s' do

    http = Net::HTTP.new(FRESHDESK_URL, 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    http.start() {|http|
        req = Net::HTTP::Get.new(FRESHDESK_VIEW_URL)
        req.basic_auth FRESHDESK_USERNAME, FRESHDESK_PASSWORD
        response = http.request(req)

        json = JSON.parse(response.body)

        items = []
        agents = {}
        for ticket in json
            if ticket['status'] != 5                                           
                unclaimed = if ticket['responder_id'] then false else true end 
                obj = { subject: ticket['subject'], created_at: ticket['created_at'], unclaimed: unclaimed }
                items << obj                                                   
            end

            agent = agents[ticket['responder_name']]

            if agent
                agent['count'] = agent['count'] + 1
            else
                agents[ticket['responder_name']] = {}
                agents[ticket['responder_name']]['name'] = ticket['responder_name']
                agents[ticket['responder_name']]['count'] = 1
            end

        end

        agents_list = []
        agents.each do |key, value|
            obj = { name: value['name'], count: value['count'] }
            
            # Show only agents that exist
            if !FRESHDESK_IGNORE_USERS.include?(value['name'])
                agents_list << obj
            end
        end

        send_event('freshdesk', { items: items, agents: agents_list })

    }
end
