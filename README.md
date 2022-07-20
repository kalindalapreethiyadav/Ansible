# ansible

This repository will have our ansible learnings and our CM of the Project.

### What is a playbook ????

```
A Playbook is a list of plays. That's why always a playbook starts as a list ( - )
```

### What is a play ?

```
A Play is a list of tasks
```

### What is a task ?

```
Any action that you want to do is called a task
    ex: Installing a package, checking the uptime of the machine , creating a user account . . .. 

``` 


### What is a fact in ansible ?

```
A Fact is nothing but a property of the target node. Before you run any playbook, ansible collects all the facts and keep it ready.


Ex: ansible -i invenetory all -m setup 
``