# Installing the lab database

Throughout this book we'll be relying on a singular set of data for our queries. The data is based on a set of orders from a hypothetical book publisher of SQL-based novels, using a database named "sqlnovel" for all our queries. We'll discuss this data more throughout the book, but for now let's just create the database and populate the sample data by loading and executing a prepared SQL script.

First, download the "[Create_SQLNovel_database.sql](./Create_SQLNovel_database.sql)" script.

Next, open the MySQL Workbench, and click on the Month of Lunches connection.

![MySQL Connections](SQLNovel%20database%20installation_2023-07-01-08-49-59.png)

Once the connection is open, select **File > Open SQL Script** from the top menu to open a separate window to find the file you just downloaded. Alternatively, you can press Ctrl-Shift-O (that's "O" as in Open, not a zero) to open the window.

![MySQL Workbench Open SQL Script](SQLNovel%20database%20installation_2023-07-01-08-55-16.png)

Browse to the file and then select it and click Open to open it in the Workbench. You should now see a script with a header tab that says the name of the file.

![MySQL Workbench script contents](SQLNovel%20database%20installation_2023-07-01-08-55-35.png)

All we need to do from here is execute this script to create the database and populate it with data. To do this, select **Query** from the top menu, and then **Execute (All or Selection)**.

![MySQL Workbench Execute (All or Selection)](SQLNovel%20database%20installation_2023-07-01-08-56-05.png)

After executing, you should see lots of green checkmarks in the Output panel below the script, to confirm the script ran.

![Script output](SQLNovel%20database%20installation_2023-07-01-08-56-43.png)

On the left, in the Navigator panel, switch from Administration to **Schemas**. This can be done by clicking on the word Schemas at the bottom of the pane. Then right-click in the white space of that window and select **Refresh All**.

![MySQL Workbench Refresh All](SQLNovel%20database%20installation_2023-07-01-08-57-07.png)

After refreshing, you should see the "sqlnovel" database appear under SCHEMAS, with other items such as Tables and Views beneath it. This confirms we've created the sample database.

![MySQL Workbench SCHEMAS](SQLNovel%20database%20installation_2023-07-01-08-57-25.png)

Finally, let's do a few things to clean up the Workbench before we use it again. First, if you see a panel on the on the right side that says **SQLAdditions**, let's close that since we won't be using it.

![SQLAdditions](SQLNovel%20database%20installation_2023-07-01-08-57-56.png)

To close it, from the top menu select **View > Panels > Hide Secondary Sidebar**.

![Hide Secondary Sidebar](SQLNovel%20database%20installation_2023-07-01-08-58-15.png)

Before we exit the application, we're also going to want to close the tab with the database installation script we just executed. If we don't close it, the Workbench will open it automatically the next time we start the application. Since we aren't planning on using this script again anytime soon, let's close it either by clicking on the **X** to the right of the script name in the tab, or by selecting **File > Close Tab** from the top menu.

![MySQL Workbench Close Tab](SQLNovel%20database%20installation_2023-07-01-08-58-44.png)

Alright, we're good to exit the Workbench application for now, and we're ready to start querying data in Chapter 2!
