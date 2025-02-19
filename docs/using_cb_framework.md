# Using the Couchbase Demo framework

The Couchbase Demo Framework is designed to operate in two modules

* Interactive
* recording

Please refer to the following sections for more detail

<!-- TOC START min:2 max:6 link:true asterisk:false update:true -->
- [Interactive](#interactive)
- [Recording mode](#recording-mode)
- [Toggling modes](#toggling-modes)
  - [First time enabling recording mode](#first-time-enabling-recording-mode)
- [Templating, Setting, and Viewing variables](#templating-setting-and-viewing-variables)
  - [Manually setting a variable](#manually-setting-a-variable)
  - [Viewing the known variables](#viewing-the-known-variables)
- [Replaying a demo](#replaying-a-demo)
- [Bundling a demo for distribution](#bundling-a-demo-for-distribution)
<!-- TOC END -->


## Interactive

In the interactive mode you are able to execute different modules, follow the on-screen prompts and generally play around with steps.

## Recording mode

The recording mode is very similar to the interactive mode, in that you are able to execute different modules, run series of steps and build up demos.  However,  while in recording mode,  every module you execute and every value you supply will be recorded in a demo file that allows you replay the demo on-demand.

## Toggling modes

It is very easy to toggle between modes using the Couchbase Demo Framework, simple hit the **'w'** key.  To change the demo file to record to simply hit the **'c'** key.

At the top of the framework you will see the following

![empty write mode](https://github.com/craig-kovar/cb-demo-framework/blob/master/docs/cb-demo-framework-mode.png)

### First time enabling recording mode

The first time you enable _recording_ mode,  it will prompt you to specify a file to record.  After you enter the name of the file it will then prompt you to provide a brief description.  This description will be displayed as part of the UI.

![new recording](https://github.com/craig-kovar/cb-demo-framework/blob/master/docs/cb-demo-framework-newrecording.png)

After you follow the onscreen prompts you will then see the mode set to **recording** and the file being written to displayed as well.

![recording](https://github.com/craig-kovar/cb-demo-framework/blob/master/docs/cb-demo-framework-recording.png)

**NOTE - If you select an existing demo file, you will be prompted whether to override the file or append to the file**


## Templating, Setting, and Viewing variables

The Couchbase Demo Framework supports templating within modules. Depending on the command being executed per step a _variable_ may be assigned.  The value of this variable can then be accessed in subsequent steps by enclosing the variable in {{}}.  An example of this may look like the following within a module or recorded demo file

```
PROMPT~Enter username~USER~Administrator
MESSAGE~You entered the username of {{USER}}
```

In this example,  we prompt the user for a username.  We store the entered value into a variable **USER** (Administrator is a default value here) and then display that value in a message back to the user.

For further reference on the supported commands and syntax of a module file please refer to [module language overview](./module_language.md)

### Manually setting a variable

Within the module language there are a number of ways a variable can be set, such as PROMPT, CODE, or others.  However,  sometimes you want to directly set a variable as well.  This can be done by selecting **'s'**

This will prompt you for the variable name and value

### Viewing the known variables

You can alternatively view the list of known variables by selecting **'v'**.  This will list all known variables and values

![variables](https://github.com/craig-kovar/cb-demo-framework/blob/master/docs/cb-demo-framework-variables.png)

## Replaying a demo

After you have recorded a demo, you can now replay the demo on demand.  The Couchbase Demo Framework manages two lists to display, **MODULES** for interactive and/or recording mode and **DEMOS** to replay recorded demos.  To switch between the two display modes simple select the **'d'** option.  Once you are on the **demo** screen simply select the demo to run.

**NOTE - As noted recording mode will capture the user input except for a few noted exceptions [_config_cb_cluster.mod_, _config_secret.mod_ ].  The generated yaml output files will still be available however, so best practice is to turn off recording when running these modules and turn back on afterwards.**

## Bundling a demo for distribution

The Couchbase Demo Framework allows you to additionally bundle a demo into a sharable gzip file using the argument **-b** when launching the tool.

`./cb_demo_framework.ksh -b <tar file name>`

This will deploy the demo locally and capture the artifacts into the specified tar file during execution. You additionally have the ability to manually add any files to the bundled demo.  However,  please note that setting the **-b** flag will not allow you to run any modules and only configured demos.

![bundle](https://github.com/craig-kovar/cb-demo-framework/blob/master/docs/cb-demo-framework-bundle.png)
