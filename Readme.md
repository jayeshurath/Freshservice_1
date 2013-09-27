# Description #
A dashing widget that displays tickets for [Freshdesk.com](http://www.freshdesk.com)

 - Displays unassigned tickets subject and time.
 - Displays Ticket counts assigned to Agents.
 - Time for each ticket changes color depending on age.

## Preview ##
![Freshdesk Dashing Widget](http://i.imgur.com/sl2LliU.png)


## Usage ##

Add the widget HTML to your dashboard
```
    <li data-row="1" data-col="1" data-sizex="2" data-sizey="2">               
      <div data-id="freshdesk" data-view="Freshdesk" data-title="Freshdesk Tickets"></div>
    </li>
```

2. Create a directory called freshdesk under widgets and copy *freshdesk.coffeescript*, *freshdesk.html*, *freshdesk.scss* into the directory.

3. Copy freshdesk.rb into your jobs folder.

4. Modify the ```FRESHDESK_URL``` and ```FRESHDESK_USERNAME``` in the *freshdesk.rb* file.

5. Add [freshdesk-background.png](http://i.imgur.com/uJ4xjX4.png) to the *assets/images* folder.



## More Info ##
[Freshdesk API Documentation](http://freshdesk.com/api)