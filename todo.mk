# Originaly from github.com/tj/make/todo

# Output to-do items per file.
todo:
	@grep \
		--exclude-dir=./vendor \
		--text \
		--color \
		-nRo 'TODO:.*' . || true
.PHONY: todo