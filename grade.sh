CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


if [[ -f "student-submission/ListExamples.java" ]]
then    
    echo 'You submitted the correct file'
else    
    echo 'File not detected'
    exit 1
fi 

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area
cd grading-area

javac -cp $CPATH ListExamples.java TestListExamples.java 2>err.txt
cat err.txt
exit 1



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
