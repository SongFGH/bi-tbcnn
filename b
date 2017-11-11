if [ ! -d code ]; then
	docker build -t bi-tbcnn:crawler crawler
	mkdir -p code
	docker run -v $(pwd)/input:/input:ro -v $(pwd)/code:/code -it bi-tbcnn:crawler
fi 
if [ ! -d ast ]; then
	docker build -t bi-tbcnn:parser parser
	mkdir -p ast
	docker run -v $(pwd)/code:/code:ro -v $(pwd)/ast:/ast -it bi-tbcnn:parser
fi
if [ ! -d vec ]; then
	docker build -t bi-tbcnn:ast2vec ast2vec
	mkdir -p vec
	docker run -v $(pwd)/input:/input:ro -v $(pwd)/ast:/ast:ro -v $(pwd)/vec:/vec -it bi-tbcnn:ast2vec
fi
if [ ! -d model ]; then
	docker build -t bi-tbcnn:bi-tbcnn bi-tbcnn
	mkdir -p model
	docker run -v $(pwd)/input:/input:ro -v $(pwd)/vec:/vec:ro -v $(pwd)/model:/model -it bi-tbcnn:bi-tbcnn
fi
