# MySQL Installation

[https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)

On the MySQL Community Downloads page, select "MySQL Community Server", which should shou you a screen that looks like this. You will probably have a later version than the one in this image (8.0.29), but that shouldn't be an issue.

![MySQL Community Server download page](MySQL%20installation_2023-07-01-08-32-02.png)

Go ahead and select the Operating System you want, then click "Go to Download Page." From there choose the smaller the downloads to install, which in this case is only 2.3 MB.

![MySQL Installer](MySQL%20installation_2023-07-01-08-36-27.png)

You may be asked to create a free Oracle Web Account, which is not necessary to download the software. If you prefer to not create an account, you can click on "No thanks, just start my download."

After the download completes, execute it to begin the installation process. You can select "Custom" at the first screen and click "Next" to proceed. For the exercises in this book we only need three things:

* the most recent version of MySQL Server
* the most recent version of MySQL Workbench
* the most recent Connector/ODBC

![Products to be installed](MySQL%20installation_2023-07-01-08-37-36.png)

After downloading these items, continue to the next screen to install the selected items.

After installation of the products is complete, proceed to the configuration.

For Type and Networking, accept Config Type of "Development Computer" as well as all other defaults.

Accept the defaults for Authentication Method of using Strong Password Encryption.

Under Accounts and Roles enter a MySQL Root Password, and store it somewhere so you don't forget it. Also click "Add user" and create a MySQL User account "lunch" for Host "&lt;All Hosts (%)&gt; and the Role "DB Admin," and create and store a password for this user as well. We will use the "lunch" user for all our exercises in throughout the book.

Keep the defaults for the Windows Service, then go to the next screen and click "Execute" for Apply Configuration. This may take few minutes, depending on your computer.

When the installation is complete, check the box to "Start MySQL Workbench" and then click "Finish" to conclude the installation.

We're not going to execute an SQL just yet, but let's take a moment to get a little familiarity with the Workbench.

First, you should see a Local Instance under MySQL Connections. It should look something like this.

![MySQL connections](MySQL%20installation_2023-07-01-08-40-51.png)

An instance is an installation of MySQL that can contain one of more databases. Keep in mind that often when people say "the database is down" what has really happened is an entire instance has gone offline or become unavailable for connections.

If you click on that rectangle then you should see a pop-up like this:

![Connect to MySQL Server](MySQL%20installation_2023-07-01-08-41-23.png)

This indicates we're going to connect to our new local instance of MySQL (localhost) as User "root". The "root" user is the default administrative user, and mentioned before we would rather connect with a different user.

Click "Cancel" to close the box, and then click the "+" to the right of "MySQL Connections".

Let's create a new connection with Name "Month of Lunches" and change the hostname to "localhost" and the Username to the "lunch" user we created earlier. We'll use all the defaults by clicking "OK".

![Setup New Connection](MySQL%20installation_2023-07-01-08-41-57.png)

We should now see out new "Month of Lunches" connection under "MySQL Connections".

![MySQL Connections](MySQL%20installation_2023-07-01-08-42-19.png)

Now let's click on our new "Month of Lunches" connection. Enter the password we used when creating the "lunch" user, and click "Save password in vault" so we don't need to enter the password each time we connect.

![Connect to MySQL Server](MySQL%20installation_2023-07-01-08-42-42.png)

Click OK to connect to your local MySQL, and suddenly there will be a whole lot more on the screen. Don't worry: we're going to stop here for now. There's a lot of options in the Workbench, and we'll cover many of them in due course, but rest assured nearly everything we do will be only in the part where it says "Query 1". That's where we'll be writing and executing our SQL.

![MySQL Workbench](MySQL%20installation_2023-07-01-08-43-06.png)

When you're done looking around, go ahead and select "File" then "Exit", or just click the big "X" in the upper-right corner to exit the Workbench.

## Add MySQL Workbench to Start Menu

The above does not automatically add a menu item for opening MySQL Workbench in the future. An easy way to add this is to navigate to the installation directory (`C:\Program Files\MySQL\MySQL Workbench 8.0`) in Windows Explorer, then right click on `MySQLWorkbench.exe` and select **Pin to Start**:

![Pin to Start](MySQL%20installation_2023-07-01-09-26-22.png)

You can then start MySQL Workbench by using the pinned icon in your start menu.

If it looks like the above "lunch" user has vanished, it's probably because you're now running the workbench as your normal user instead of the Administrator used during installation. You'll need to repeat the above steps to re-add the connection using the "lunch" user.
