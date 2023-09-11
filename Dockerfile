FROM wilbercui/mulval:latest

COPY input/input.P /input/
COPY ruleset/ruleset.P /input/
WORKDIR /input/
CMD [ "/bin/bash", "-c", "graph_gen.sh input.P -v --rulefile ./ruleset.P; /bin/bash" ]