register s3n://uw-cse-344-oregon.aws.amazon.com/myudfs.jar

-- load the test file into Pig
raw = LOAD 's3n://uw-cse-344-oregon.aws.amazon.com/cse344-test-file' USING TextLoader as (line:chararray);

-- parse each line into ntriples
ntriples = foreach raw generate FLATTEN(myudfs.RDFSplit3(line)) as (subject:chararray,predicate:chararray,object:chararray);

-- group the n-triples by subject column
objects = group ntriples by (subject);

-- counts associated with each subject (the x value of the histogram)
objects_counted = foreach objects generate COUNT(ntriples) as (x_value);

-- group x values to calculate y values
x_group = group objects_counted by (x_value);

-- count the # of values to generate y values of the histogram
y = foreach x_group generate COUNT($1) as (y_value);

-- generate total number of data points in the graph
data_points = foreach (group x_group all) generate COUNT(x_group);

dump data_points;




