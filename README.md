Fuse Contacts
=============

Library to use Contacts in [Fuse-Open](http://www.fuse-open.com).

Issues, feature request and pull request are welcomed.


## Usage:

### JS

```javascript
var Contacts = require('FuseJS/Contacts');
Contacts.authorize().then(function (status) {
	console.log(status);
	if (status === 'AuthorizationAuthorized') {
		console.log(JSON.stringify(Contacts.getAll()));
	}
})

```

API
---

### require

```javascript
var Contacts = require('FuseJS/Contacts');
```

### authorize

Returns a promise with the status of authorization

```javascript
var auth = Contacts.authorize();
auth.then(function (status) {
	console.log(status);
})
```

status can be:

- AuthorizationDenied
- AuthorizationRestricted
- AuthorizationAuthorized

(and some error results)

### getAll

Returns an array of hashes of contacts

```javascript
console.log(JSON.stringify(Contacts.getAll()));
```

### getPage

Returns an array of hashes of contacts, split by pages

```javascript
readInLoop(0); // call the function, starting with page 0

function readInLoop(page) {
	var numEntries = 30; // number of entries per page
	var proceed = true; // boolean to track state of recursion
	var contactsPageList = contacts.getPage(numEntries, page); // retrieves the numEntries contacts objects, offset by (page * numEntries)
	if (contactsPageList.length < numEntries) proceed = false; // if the current page returned less results than numEntries, we have reached the end of all contacts
	// ... do something with contactsPageList here!
	if (proceed) readInLoop(page+1); // call ourselves recursively with next page
}
```
