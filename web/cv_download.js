// Resolve against the app's base URL, including deployments in a subdirectory.
window.downloadPortfolioCv = function () {
  const link = document.createElement('a');
  link.href = new URL('cv/CV_Modou_Mamoune_Diop.pdf', document.baseURI).href;
  link.download = 'CV_Modou_Mamoune_Diop.pdf';
  document.body.appendChild(link);
  link.click();
  link.remove();
};
