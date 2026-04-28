console.log("🚀 App started successfully!");

const os = require("os");

console.log("Hostname:", os.hostname());
console.log("Platform:", os.platform());
console.log("Architecture:", os.arch());

// Simulate some work
setTimeout(() => {
  console.log("✅ Task completed!");
}, 2000);
