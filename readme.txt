These scripts were written for an optional assignment for the University of Washington's Introduction to Data Science summer 2014 class on Coursera.

The data processed was part of the Billion Triples Challenge 2010 Dataset http://km.aifb.kit.edu/projects/btc-2010/ and the purpose of the assignment was to do a basic graph analysis using the Apache Pig Latin language with Amazon Elastic MapReduce.

The data is an RDF dataset that contains approximately one billion triples from the Semantic Web.  Some webpages have a machine-readable description of their semantics stored as RDF triples.  The dataset was obtained by a crawler that extracted all RDF triples from the world wide web.

The triples consist of the following format: subject  predicate  object 

In some cases there is a fourth element [context] which effectively makes the triple a quad.

The script problem_2A.pig computes the total number of x,y values in a histogram after grouping the data by subject and taking a count (x values) and counting the total number of subjects associated with each particular count (y values).

The script problem_3.pig takes a subgraph for all triples that contain a subject with the string 'business' and a chain of length two.

A sample test file (cse344-test-file) was used to test the scripts which were then used to process larger files.  The sample test file is included in this repository for reference purposes.

