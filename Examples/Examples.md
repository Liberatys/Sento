# Examples

## Windows

**choco**

	[plug.choco]
	firefox
	git
	javaruntime
	notepadplusplus

## Macos

**brew**

	[plug.brew]
	calc
	cargo
	go
	dar



## Cross

**folder_structure**

	[plug.folder_structure]

	/go/src/github.com/
	/rust/src/github.com/
	/ruby/src/github.com/
	/java/src/github.com/


**full example**

	![plug.choco]
	firefox
	git
	javaruntime
	notepadplusplus

	[plug.brew]
	calc
	cargo
	go
	dar

	![plug.folder_structure]
	/go/src/github.com/
	/rust/src/github.com/
	/ruby/src/github.com/
	/java/src/github.com/



In this example all calls to choco and to folder_structure are being skipped.
By using ! you can create just one file for all your platforms and then just comment out what is not needed.
