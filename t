language=java
docker build -t bi-tbcnn:bi-tbcnn bi-tbcnn
docker run -v $(pwd)/input:/input:ro -v $(pwd)/vec:/vec:ro -v $(pwd)/model:/model -it bi-tbcnn:bi-tbcnn \
   python /bi-tbcnn/bi-tbcnn/train_tbcnn.py /vec/fast_algorithms_trees_$language.pkl /vec/fast_pretrained_vectors_$language.pkl /logs
ls -l model/*
