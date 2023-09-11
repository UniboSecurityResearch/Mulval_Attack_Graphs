## How to use.

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

## Dockerfile.
A Dockerfile is provided to build a container that automatically executes `graph_gen` using as input file `./input/input.P` and as rules file `./ruleset/ruleset.P`.
To build use:
```
docker build -t mulval .
```

To run the container type:
```
docker run -it --rm mulval
```

At the end, before stopping the container, remember to copy the generated attack graph using:
```
docker cp CONTAINERID:/input/AttackGraph.txt ./
docker cp CONTAINERID:/input/AttackGraph.csv ./
docker cp CONTAINERID:/input/AttackGraph.pdf ./
```

## Creating customized rule set (From Mulval documentation).

To develop your own interaction rules, you can create new rule files, e.g. "my_interaction_rules.P", and use the `-r` or `-a` options to load your rule files. The default rule files can be found under the kb/ folder in this package.

At the beginning of a rule file, you must declare the primitive and derived predicates, and table all derived predicates. Facts with primitive predicates come from the input, and facts with derived predicates are defined by the interaction rules. Every predicate used by the interaction rules must have a declaration of either "primitive" or "derived", otherwise you may get an error message of "undefined predicate" during evaluation, and the attack graph generation may fail with a warning message telling you which predicate's declaration is missing. Tabling will prevent the XSB reasoning engine from entering an infinite loop and increase the efficiency of reasoning by memoizing intermediate results.

Each interaction rule is introduced by "interaction_rule(Rule, Label)", where Rule is a Datalog rule and Label is some plain-text explaining its meaning. The labels will become annotations in attack graph. 
Once you have developed your own rule set, you can test it by using the `-r RULEFILE` option with `graph_gen.sh` to let it load RULEFILE instead of using the default ruleset. If you want your rule file to be added to the default ruleset, you can use the `-a RULEFILE` option instead.

## Useful Links.
1. [Mulval github][2]
2. [Reference Paper for the extended ruleset][3]
3. [Reference Paper Transaction][4]

[1]: https://hub.docker.com/r/wilbercui/mulval
[2]: https://github.com/risksense/mulval/tree/master
[3]: https://arxiv.org/pdf/1906.09786.pdf
[4]: https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9277665