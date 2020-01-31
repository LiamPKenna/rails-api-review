# _Rails API Review_

#### _Rails API built to supply data to a previously built Quiz Application, January 31st 2020_

#### By _**Liam Kenna**_

## Description

_This is an API built to supply data to a previously built Quiz Application._

_The following routes are available:_

Quiz Routes:

    GET /quizzes/
      -returns all available quizzes

    GET /quizzes/random
      -returns a single randomly selected quiz

    GET /quizzes/{quiz_id}
      -returns a single quiz by {quiz_id}

  Question Routes:

      GET /quizzes/{quiz_id}/questions
        -returns all available questions

      GET /quizzes/{quiz_id}/questions/{question_id}
        -returns a single question by {question_id}

## Setup/Installation Requirements

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

_Ruby, Rails_

### License

*This software is available under the MIT License*

Copyright (c) 2020 **_Liam Kenna_**
