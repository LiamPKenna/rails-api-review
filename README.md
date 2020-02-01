# _Rails API Review_

#### _Rails API built to supply data to an existing Quiz Application, January 31st 2020_

#### By _**Liam Kenna**_

## Description

_This is an API constructed to supply data to an existing Quiz Application built to function with any flowchart style decision branching.  For demonstration purposes, the API is not currently restricted and will allow full CRUD accessibility to all users._

#### The following routes are available:

_Quiz Routes:_
```
GET /quizzes/
  -returns all available quizzes

GET /quizzes/random
  -returns a single randomly selected quiz

GET /quizzes/{quiz_id}
  -returns a single quiz by {quiz_id}

POST /quizzes/
  -creates a new quiz
  -payload format:
    {
      "title": "title text",
      "sub_title": "sub title text"
    }

PATCH /quizzes/{quiz_id}
  -updates a single quiz
  -can be multiple or single parameters
  -payload format:
    {
      ...same as POST route ...
    }

DELETE /quizzes/{quiz_id}
  -destroys a single quiz by {quiz_id}
```
_Question Routes:_
```
GET /quizzes/{quiz_id}/questions
  -returns all available questions

GET /quizzes/{quiz_id}/questions/{question_id}
  -returns a single question by {question_id}

POST /quizzes/{quiz_id}/questions
  -creates a new question
  -payload format:
    {
      "text": "question text",
    	"is_binary": "false",  // (is this a yes/no question)
    	"y_link": "{destination_number}", // (card to navigate to for a yes answer)
    	"n_link": "{destination_number}", // (card to navigate to for a no answer)
    	"y_is_final": "false", // (does a yes answer end the quiz)
    	"n_is_final": "false" // (does a no answer end the quiz)
    }

PATCH /quizzes/{quiz_id}questions/{question_id}
  -updates a single question
  -can be multiple or single parameters
  -payload format:
    {
      ...same as POST route ...
    }

DELETE /quizzes/{quiz_id}/questions/{question_id}
  -destroys a single question by {question_id}
```
_Finish Routes:_
```
GET /quizzes/{quiz_id}/finishes
  -returns all available finishes

GET /quizzes/{quiz_id}/finishes/{finish_id}
  -returns a single finish by {finish_id}

POST /quizzes/{quiz_id}/finishes
  -creates a new finish
  -payload format:
    {
      "text": "finish text",
      "sub_text": "Detail text for the specific finish.",
      "img_src": "img/swift.png"
    }

PATCH /quizzes/{quiz_id}finishes/{finish_id}
  -updates a single finish
  -can be multiple or single parameters
  -payload format:
    {
      ...same as POST route ...
    }

DELETE /quizzes/{quiz_id}/finishes/{finish_id}
  -destroys a single finish by {finish_id}
```
_Answer Routes:_
```
GET /quizzes/{quiz_id}/questions/{question_id}/answers
  -returns all available answers for a question

GET /quizzes/{quiz_id}/questions/{question_id}/answers/{answer_id}
  -returns a single answer by {answer_id}

POST /quizzes/{quiz_id}/questions{question_id}/answers
  -creates a new answer for a question
  -payload format:
    {
      "text": "answer text",
      "linked_card": "{destination_number}", // (card to navigate when answer is chosen)
      "is_finish": "true" // (does selecting this answer go to a finish)
    }

PATCH /quizzes/{quiz_id}questions/{question_id}/answers/{answer_id}
  -updates a single answer
  -can be multiple or single parameters
  -payload format:
    {
      ...same as POST route ...
    }

DELETE /quizzes/{quiz_id}/questions/{question_id}/answers/{answer_id}
  -destroys a single answer by {answer_id}
```

## Setup/Installation Requirements

#### Required Versions

* _Ruby @ 2.6.5_
* _Rails @ 5.2.4_

#### Installation

* _Clone to local machine_
* _Verify that you are running postgresql locally_
* _In project root folder:_
  * _$ bundle install_
  * _$ rake db:create_
  * _$ rake db:migrate_
  * _$ psql {YOUR FOLDER NAME HERE}_development < db_backup.sql_
  * _$ rake db:test:prepare_
  * _$ rails s_

## Known Bugs

_No known bugs_

## Support and contact details

_Any issues or concerns, please email liam@liamkenna.com_

## Technologies Used

_Ruby, Rails, PostgreSQL_

### License

*This software is available under the MIT License*

Copyright (c) 2020 **_Liam Kenna_**
