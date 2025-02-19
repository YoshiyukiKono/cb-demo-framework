#@ Configure SGW configuration template with connection, db, bucket, etc...
#^ Couchbase Yaml Generation, Yaml Generation, SGW
PROMPT~Enter working directory~WORKDIR~./work
PROMPT~Enter name of template file located in "templates" directory~TFILE~
PROMPT~Enter namespace where Couchbase is deployed~CBNS~
PROMPT~Enter cluster name~CLUSTER~cb-example
PROMPT~Enter port to use for SGW~PORT~4984
PROMPT~Enter SGW Database name~DATABASE~
CODE~get_pod_by_nameprefix.ksh~{{CLUSTER}},{{CBNS}}~SGWPOD
SET~SERVER~couchbase://{{SGWPOD}}.{{CLUSTER}}.{{CBNS}}.svc
PROMPT~Enter the CB Bucket to connect to~BUCKET~default
PROMPT~Enter the CB User to connect with~USER~Administrator
PROMPT~Enter the password~PASS~password
TEMPLATE~{{TFILE}}~{{WORKDIR}}~json~SGWFILE
