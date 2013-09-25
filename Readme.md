# Description #
A dashing widget that displays tickets for [Freshdesk.com](http://www.freshdesk.com)

 - Displays unassigned Tickets subject and time.
 - Displays Ticket counts assigned to Agents.
 - Ticket 

## Preview ##
![Freshdesk Dashing Widget](http://imgur.com/Q2keCCD.png)


## Usage ##

Add the widget HTML to your dashboard
```
    <li data-row="1" data-col="1" data-sizex="2" data-sizey="2">               
      <div data-id="freshdesk" data-view="Freshdesk" data-title="Freshdesk Tickets"></div>
    </li>
```

2. Create a directory called freshdesk under widgets and copy *freshdesk.coffeescript*, *freshdesk.html*, *freshdesk.scss* into the directory.

3. Modify the ```FRESHDESK_URL``` and ```FRESHDESK_USERNAME``` in the *freshdesk.rb* file.

4. Copy freshdesk.rb into your jobs folder.

## More Info ##
[Freshdesk API Documentation](http://freshdesk.com/api)