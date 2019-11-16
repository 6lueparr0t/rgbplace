package main

func unique(m map[*Client]string) map[*Client]string {
	n := make(map[*Client]string, len(m))
	ref := make(map[string]bool, len(m))
	for k, v := range m {
		if _, ok := ref[v]; !ok {
			ref[v] = true
			n[k] = v
		}
	}

	return n
}
