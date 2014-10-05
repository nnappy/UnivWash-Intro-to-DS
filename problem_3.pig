register s3n://uw-cse-344-oregon.aws.amazon.com/myudfs.jar

-- load the test file into Pig
raw = LOAD 's3n://uw-cse-344-oregon.aws.amazon.com/cse344-test-file' USING TextLoader as (line:chararray);

-- parse each line into ntriples
ntriples = foreach raw generate FLATTEN(myudfs.RDFSplit3(line)) as (subject:chararray,predicate:chararray,object:chararray);

-- filter the loaded data 
filtered = filter ntriples by subject matches '.*business.*';

-- create a second table of filter so a self join can be done
filtered2 = foreach filtered generate subject as subject2, predicate as predicate2, object as object2;

-- join filtered and filtered2
joined = join filtered by subject, filtered2 by subject2;

-- eliminate duplicate records
jointed = DISTINCT joined;

-- count number of records in alias
counted = foreach (group joined all) generate COUNT(joined);

dump counted;




