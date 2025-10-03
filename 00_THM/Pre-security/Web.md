The order for a web request to a web server is always (with minors changes) : 
1. User request in his brower the website
2. Local cache look an IP address that correspond to this webSite
3. Check the recursive DNS server for an address
4. Ask the querry root server to find authoritative DNS server
5. Authoritative DNS server respond with the IP address of the website 
6. Request go through a firewall
7. Request go through a load balancer
8. Webserver receives the GET request
9. Web application (front-end/back-end) talk to the database
10. Response with the HTML content rendered in the browser