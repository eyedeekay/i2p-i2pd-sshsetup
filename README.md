How to set up an ssh server behind i2p for personal access
==========================================================

This is a tutorial on how to set up and tweak an i2p tunnel in order to use it
to access an SSH server remotely, using either i2p or i2pd. For now, it assumes
you will install your SSH server from a package manager and that it's running
as a service.

Considerations: In this guide, I'm assuming a few things. They will need to be
adjusted depending on the complications that arise in your particular setup,
especially if you use VM's or containers for isolation. This assumes that the
i2p router and the ssh server are running on the same localhost.

Step One: Set up i2p tunnel for SSH Server
------------------------------------------

### Using Java i2p

Using java i2p's web interface, navigate to the (Links to your Router Console)[Hidden Services Manager](http://127.0.0.1:7657/i2ptunnelmgr)
and start the tunnel wizard.

#### Tunnel Wizard

Since you are setting up this tunnel for the SSH server, you need to select the
"Server" tunnel type.

![Use the wizard to create a "Server" tunnel](server.png)

You should fine-tune it later, but the Standard tunnel type is easiest to start
with.

![Of the "Standard" variety](standard.png)

Give it a good description:

![Describe what it is for](describe.png)

And tell it where the SSH server will be available.

![Point it at the future home of your SSH server](hostport.png)

Look over the results, and save your settings.

![Save the settings.](approve.png)

#### Advanced Settings

Now head back over the the Hidden Services Manager, and look over the available
advanced settings. One thing you'll definitely want to change is to set it up
for interactive connections intstead of bulk connections.

![Configure your tunnel for interactive connectionss](interactive.png)

Besides that, these other options can affect performance when accessing your SSH
server. If you aren't that concerned about your anonymity, then you could reduce
the number of hops you take. If you have trouble with speed, a higher tunnel
count might help. A few backup tunnels are probably a good idea. You might have
to dial-it-in a bit.

![If you're not concerned about anonymity, then reduce tunnel length.](anonlevel.png)

### Using i2pd

Step Two: Set up SSH server
---------------------------

Step Three: Start i2p tunnels and SSH server
--------------------------------------------

Step Four: Set up i2p tunnel for SSH Client
--------------------------------------------

Step Five: Set up SSH client
----------------------------

Step Six: Start i2p tunnel for SSH Client
-----------------------------------------
