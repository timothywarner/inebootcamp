var connectionString = String.Format("DefaultEndpointsProtocol=https;AccountName={0};AccountKey={1}",
    storageAccountName, // your storage account name
    accessKey); // your storage account access key
var storageAccount = CloudStorageAccount.Parse(connectionString);
CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
CloudBlobContainer container = blobClient.GetContainerReference("my-container");


SharedAccessBlobPolicy sasConstraints = new SharedAccessBlobPolicy();
sasConstraints.SharedAccessExpiryTime = DateTime.UtcNow.AddMinutes(30);
sasConstraints.Permissions = SharedAccessBlobPermissions.Write | SharedAccessBlobPermissions.Create;

var blob = container.GetBlockBlobReference("outputfile.txt");
Console.WriteLine("{0}{1}",
    blob.Uri, blob.GetSharedAccessSignature(sasConstraints));


// SAS URI example: https://mystorageacct.blob.core.windows.net/my-container/outputfile.txt?sv=2015-12-11&sr=b&sig=9UZXdW5eqoN7aiKqvnUo60gBAr1Y2feVNnIn2Hh2iU4%3D&se=2017-02-05T12%3A52%3A34Z&sp=cw


var sas = "https://mystorageacct.blob.core.windows.net/...";
var cloudBlockBlob = new CloudBlockBlob(new Uri(sas));
await cloudBlockBlob.UploadFromFileAsync(@"c:\myfile.txt");


// c# code to download a blob using a SAS token
// Path: download-blob-sas.cs
var sas = "https://storageacct.blob.core.windows.net/...";
var cloudBlockBlob = new CloudBlockBlob(new Uri(as));
awai cloudBlockBlob.DownloadTFileAsync(@"c:\myfile.txt", FileMode.Cete);
// c# code to generate a SAS token for a blob

