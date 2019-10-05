
###### Information ######
# Name:          readme_sample_data.txt
# Course:        CS 6220
# Semester:      Fall 2019
# Instructor:    Ling Liu
# About:         A simple readme file about our initial data processing...
# Writor:        Jiaxiang Zhu
# Start Date:    2019-10-03
# Modified Date: 2019-10-04
#########################

meta_data:      has all the metadata for the products.
feedbacks_data: has all the reviews/ratings for the products.
combined_data:  are sorted json combined meta and feedbacks data into one.

All the data are separated by category.
The original json file has been processed by removing all the '\"' as it stops processing of jq utility.
Each json file in combined data is a product. Json with products from same category will be placed in its own directory.

In case of products having too little reviews, the raw feedback data are using the 5-core version. every product included will have at least 5 reviews.

As of now, I do not have time to sort based on year. so the data can be ranged from 1996 to 2014.

More to come...


