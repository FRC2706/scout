# README

Scout Features:
- Swagger JSON API
	- http://URL:3000/apidocs/
	- currently 5 endpoints
		- team_data
		- competitions
		- matches
		- objectives
		- teams
- Competitions
	- Listing: /competitions (only 153 or 2016onnb has data)
	- Create new competition (for testing): /competitions/new
- Matches
	- Listing: /competitions/<tba_code> or <id>
	- Show Info: /matches/<match_id>
		- include all autonomies and events
	- New Match: /competitions/<tba_code>/matches/new
		- you can pass all autonmoies and events