rm -rf ../data/preprocess*
rm -rf ../data/cluster*

# check out the other options available for preprocessing by running:
# python preprocess.py -h
spark-submit preprocess.py -d ../data/raw/ -v -f ../data/features.txt -o ../data/preprocess
# DBSCAN has 3 options to change, epsilon and minpts (-e and -p) as well as a
# distance metric, which is currently limited to just "euclidean" or "cosine"
spark-submit cluster.py -d ../data/preprocess -o ../data/cluster -e 1 -p 5 -m euclidean