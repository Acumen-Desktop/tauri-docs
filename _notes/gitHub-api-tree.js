async function getAllMarkdownFiles(owner, repo, branch = 'main') {
  const baseUrl = 'https://api.github.com';
  
  // Get the tree SHA for the branch
  const branchResponse = await fetch(
    `${baseUrl}/repos/${owner}/${repo}/branches/${branch}`
  );
  const branchData = await branchResponse.json();
  const treeSha = branchData.commit.commit.tree.sha;
  
  // Get the entire tree recursively
  const treeResponse = await fetch(
    `${baseUrl}/repos/${owner}/${repo}/git/trees/${treeSha}?recursive=1`
  );
  const treeData = await treeResponse.json();
  
  // Filter for markdown files
  const markdownFiles = treeData.tree.filter(
    item => item.type === 'blob' && /\.md$/i.test(item.path)
  );
  
  // Fetch content for each markdown file
  const fetchFileContent = async (file) => {
    const response = await fetch(file.url);
    const data = await response.json();
    // Content is base64 encoded
    return {
      path: file.path,
      content: Buffer.from(data.content, 'base64').toString('utf-8')
    };
  };
  
  // Fetch all files in parallel with rate limiting
  const contents = await Promise.all(
    markdownFiles.map(file => fetchFileContent(file))
  );
  
  return contents;
}

// Usage
const markdownFiles = await getAllMarkdownFiles('facebook', 'react', 'main');