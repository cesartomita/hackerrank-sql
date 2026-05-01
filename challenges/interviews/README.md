# Interviews

Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the **contest_id**, **hacker_id**, **name**, and the sums of **total_submissions**, **total_accepted_submissions**, **total_views**, and **total_unique_views** for each contest sorted by **contest_id**. Exclude the contest from the result if all four sums are `0`.

**Note:** A specific contest can be used to screen candidates at more than one college, but each college only holds **1** screening contest.

---

## Input Format

The following tables hold interview data:

- **Contests**: The **contest_id** is the id of the contest, **hacker_id** is the id of the hacker who created the contest, and **name** is the name of the hacker.

![1777667248019](image/README/1777667248019.png)

- **Colleges**: The **college_id** is the id of the college, and **contest_id** is the id of the contest that Samantha used to screen the candidates.

![1777667262441](image/README/1777667262441.png)

- **Challenges**: The **challenge_id** is the id of the challenge that belongs to one of the contests whose **contest_id** Samantha forgot, and **college_id** is the id of the college where the challenge was given to candidates.

![1777667270540](image/README/1777667270540.png)

- **View_Stats**: The **challenge_id** is the id of the challenge, **total_views** is the number of times the challenge was viewed by candidates, and **total_unique_views** is the number of times the challenge was viewed by unique candidates.

![1777667278160](image/README/1777667278160.png)

- **Submission_Stats**: The **challenge_id** is the id of the challenge, **total_submissions** is the number of submissions for the challenge, and **total_accepted_submission** is the number of submissions that achieved full scores.

![1777667287287](image/README/1777667287287.png)

## Sample Input

**Contests** Table:

![1777667326093](image/README/1777667326093.png)

**Colleges** Table:

![1777667329791](image/README/1777667329791.png)

**Challenges** Table:

![1777667336432](image/README/1777667336432.png)

**View_Stats** Table:

![1777667340035](image/README/1777667340035.png)

**Submission_Stats** Table:

![1777667345151](image/README/1777667345151.png)

Sample Output

```
66406 17973 Rose 111 39 156 56
66556 79153 Angela 0 0 11 10
94828 80275 Frank 150 38 41 15
```


## Explanation

- **Contest** `66406` is used in college `11219`. In this college, challenges `18765` and `47127` are asked. Summing their stats:
  - Sum of total submissions: `27 + 56 + 28 = 111`
  - Sum of total accepted submissions: `10 + 18 + 11 = 39`
  - Sum of total views: `43 + 72 + 26 + 15 = 156`
  - Sum of total unique views: `10 + 13 + 19 + 14 = 56`

- **Contest** `66556` (Angela) and `94828` (Frank) are calculated similarly.