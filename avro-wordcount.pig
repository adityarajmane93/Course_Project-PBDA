A = LOAD '/data/test.avro' AS (line:chararray);
B = FOREACH A GENERATE FLATTEN(TOKENIZE(line,'.[-,: #]'))as word;
github = FILTER B by (LOWER(word)=='github'); 
ggithub = GROUP github by (LOWER(word));
cgithub = FOREACH ggithub GENERATE COUNT(github), group;
store cgithub into './avro-count';
