### BigQuery Table Types
![enter image description here](https://miro.medium.com/max/1155/1*Cn4thIDHsL8K4H8vCOuS6w.png)
### BigQuery Schemas
- Schema는 name, data type, description and mode를 활용하여 컬럼정의서를 설명
- Data Types
	- integers
	- complex 
	- `ARRAY`
	- `STRUCT`
- Column mode
	- `NULLABLE`
	- `REQUIRED`
	- `REPEATED`
- Table Schema는 데이터를 table에 적재 할때 또는 empty table 생성할때 정의되어야함
- 대체로,  데이터를 적재할때
	- `auto-dection` : 자동 스키마 감지
	- `self-describging source data format`(Avro, Parquet ORC, Cloud Firestore, Cloud Datastore)를 지원
- Tip	
	- `SELECT *`은 되도록이면 피해라!!
	- 필요한 컬럼들만 정의하여 쿼리
	- 특정컬럼을 제외하기 위해서는 `SELECT * EXCEPT `를 사용
- json파일 예시
	```
	[  
	{  
	"description": "[DESCRIPTION]",  
	"name": "[NAME]",  
	"type": "[TYPE]",  
	"mode": "[MODE]"  
	},  
	{  
	"description": "[DESCRIPTION]",  
	"name": "[NAME]",  
	"type": "[TYPE]",  
	"mode": "[MODE]"  
	}  
	]
	```
#### BigQuery SQL Function Reference
-**[bigquery operator reference](https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators)**
![enter image description here](https://miro.medium.com/max/1155/0*TNOxcPP4ekl6ioab)
### Loading Data into BigQuery
![enter image description here](https://miro.medium.com/max/3663/1*qebOoCTw_tbEcRvw_YW5bg.png)
### The Life of a BigQuery SQL Query

