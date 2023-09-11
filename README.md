## How to use
Install the following Mulval docker image: [wilbercui/mulval][1]
```
sudo docker pull wilbercui/mulval
```

To run the docker image:
```
sudo docker run -it --rm wilbercui/mulval
```

When the container has started, create a file called **input.P** in the current working directory and copy in it the content of a file .P in the input directory. Then, inside the same directory, create a file called **rules.P** and copy in it the content of the file ruleset.P in the ruleset directory.

To produce the attack graph run the following command:
```
graph_gen.sh input.P -v --rulefile ./rules.P
```

[1]: https://hub.docker.com/r/wilbercui/mulval