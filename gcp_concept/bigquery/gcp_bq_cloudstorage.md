### Cloud Storage gsutil
#### du
- Display Object size usage
#### Synoposis
` gsutil du url`
#### Description
- space 양을 보여줌 
- file이나 주어진 url hierarchy하게 파일의 사이즈를 보여줌
- Linux (du -b) cli와 유사
- `gsutil du -s gs://url ` :  해당 url의 모든사이즈를 보여줌

#### option
- 0
	- Ends each output line with a 0 byte rather than a newline. This can be useful to make the output more easily machine-readable.
- a
	- Includes non-current object versions / generations in the listing (only useful with a versioning-enabled bucket). Also prints generation and metageneration for each listed object.
- c
	-Includes a grand total at the end of the output.
- e
	- A pattern to exclude from reporting. Example: -e "*.o" would exclude any object that ends in ".o". Can be specified multiple times.
- h
	- Prints object sizes in human-readable format (e.g., 1 KiB, 234 MiB, 2GiB, etc.)
- s
	- Displays only the grand total for each argument.

- X
	- Similar to -e, but excludes patterns from the given file. The patterns to exclude should be one per line.

#### Example
## Examples
 - To list the size of all objects in a bucket:
	-	`gsutil du gs://bucketname`

- To list the size of all objects underneath a prefix:
	- `gsutil du gs://bucketname/prefix/*`

 -	To print the total number of bytes in a bucket, in human-readable form:
	- `gsutil du -ch gs://bucketname`
- To see a summary of the total bytes in the two given buckets:
	- `gsutil du -s gs://bucket1 gs://bucket2`
 - To list the size of all objects in a versioned bucket, including objects that are not the latest:
	- `gsutil du -a gs://bucketname`
- To list all objects in a bucket, except objects that end in ".bak", with each object printed ending in a null byte:
	- `gsutil du -e "*.bak" -0 gs://bucketname`
- To get a total of all buckets in a project with a grand total for an entire project:
	- `gsutil -o GSUtil:default_project_id=project-name du -shc`

