
## Challenge 1 - Who Have Published What At Where?
'''
L.S. Good!
'''

SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, titles.title, publishers.pub_name
FROM authors
Inner Join titleauthor
On authors.au_id = titleauthor.au_id
Inner Join titles
On titleauthor.title_id = titles.title_id
Inner Join publishers
On titles.pub_id = publishers.pub_id


## Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, COUNT(titles.title) AS Titles, publishers.pub_name
FROM authors, titleauthor, titles, publishers
WHERE authors.au_id = titleauthor.au_id AND titleauthor.title_id = titles.title_id AND titles.pub_id = publishers.pub_id
group BY authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, publishers.pub_name


## Challenge 3 - Best Selling Authors

SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, titles.title, sum(sales.qty) AS Total
FROM authors, titleauthor, titles, sales
WHERE authors.au_id = titleauthor.au_id AND titleauthor.title_id = titles.title_id AND titles.title_id = sales.title_id
group BY authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
Order by Total DESC
Limit 3;

'''
L.S. Correct!
'''
## Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, titles.title, sum(sales.qty) AS Total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
Order by Total DESC;





