# Top Competitors

Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective **hacker_id** and **name** of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending **hacker_id**.

Input Format

The following tables contain contest data:

**Hackers**: The **hacker_id** is the id of the hacker, and **name** is the name of the hacker.

![1775239292127](image/README/1775239292127.png)

**Difficulty**: The **difficult_level** is the level of difficulty of the challenge, and **score** is the maximum score that can be achieved for a challenge at that difficulty level.

![1775239299702](image/README/1775239299702.png)

**Challenges**: The **challenge_id** is the id of the challenge, the **hacker_id** is the id of the hacker who created the challenge, and **difficulty_level** is the level of difficulty of the challenge.

![1775239305042](image/README/1775239305042.png)

**Submissions**: The **submission_id** is the id of the submission, the **hacker_id** is the id of the hacker who made the submission, **challenge_id** is the id of the challenge that the submission belongs to, and **score** is the score of the submission.

![1775239311927](image/README/1775239311927.png)

Sample Input

**Hackers** Table: 

![1775239318745](image/README/1775239318745.png)

**Difficulty** Table:  

![1775239324498](image/README/1775239324498.png)
 
**Challenges** Table: 
 
![1775239334008](image/README/1775239334008.png)

**Submissions** Table: 

![1775239338583](image/README/1775239338583.png)

Sample Output

```text
90411 Joe
```

Explanation

Hacker `86870` got a score of `30` for challenge `71055` with a difficulty level of `2`, so `86870` earned a full score for this challenge.

Hacker `90411` got a score of `30` for challenge `71055` with a difficulty level of `2`, so `90411` earned a full score for this challenge.

Hacker `90411` got a score of `100` for challenge `66730` with a difficulty level of `6`, so `90411` earned a full score for this challenge.

Only hacker `90411` managed to earn a full score for more than one challenge, so we print the their **hacker_id** and **name** as `2` space-separated values.