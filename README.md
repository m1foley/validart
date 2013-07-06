validart
========

Proof-of-concept for publishing a server's ActiveModel validations. Also an opportunity to play around with Rails 4 & Jbuilder.

Instructions
------------
- Install gems: `bundle`
- Run the server: `rails s`
- Simulate a client reading the server validations: `ruby client_sim.rb`

Example output
--------------
Command: `curl http://localhost:3000/external_validations.json`

Output:

    [{"name":"User","validators":[{"class":"ActiveRecord::Validations::PresenceValidator","attributes":["name"],"options":{}},{"class":"ActiveModel::Validations::FormatValidator","attributes":["phone_number"],"options":{"with":"(?-mix:\\A\\(\\d{3}\\) \\d{3}-\\d{4}\\z)","allow_blank":true}},{"class":"ActiveModel::Validations::InclusionValidator","attributes":["status"],"options":{"in":["archived"],"allow_blank":true}}]},{"name":"ValidationlessObject","validators":[]}]
