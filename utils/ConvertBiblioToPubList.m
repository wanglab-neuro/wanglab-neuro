%% convert CSV citation exported from sciwheel to publication list for lab website

% 1/ Export CSV file
% 2/ Fix dates and other fields if needed then import in Matlab
% Could be done from bib or medline file as well

% Pub list format:
% - title: General anesthetics activate a potent central pain-suppression circuit in the amygdala
%   image: Hua_2020.jpg
%   description: General anesthesia (GA) can produce analgesia (loss of pain) independent of inducing loss of consciousness, but the underlying mechanisms remain unclear. We hypothesized that GA suppresses pain in part by activating supraspinal analgesic circuits and discovered a distinct population of GABAergic neurons activated by GA in the mouse central amygdala (CeAGA neurons). Using in vivo calcium imaging and optogenetic activation, our study points to CeAGA as a potential powerful therapeutic target for alleviating chronic pain.
%   authors: Hua, T., Chen, B., Lu, D., Sakurai, K., Zhao, S., Han, B.X., Kim, J., Yin, L., Chen, Y., Lu, J., Wang, F.
%   link:
%     url: https://doi.org/10.1038/s41593-020-0632-8
%     display: Nature Neuroscience (2020)
%   highlight: 1

fid  = fopen(fullfile(cd,'fullpublist.yml'),'w');

for pubNum=1:size(fwreferences,1)
    fprintf(fid,'- title: %s\r\n', fwreferences.Title(pubNum));
    fprintf(fid,'\timage: \r\n');
    fprintf(fid,'\tdescription: \r\n');
    fprintf(fid,'\tauthors: %s\r\n', fwreferences.Authors(pubNum));
    fprintf(fid,'\tlink: \r\n');
    fprintf(fid,'\t\turl: %s\r\n', fwreferences.Url(pubNum));
    fprintf(fid,'\t\tdisplay: %s (%i)\r\n', fwreferences.Journal(pubNum), year(fwreferences.PublicationDate(pubNum)));
    fprintf(fid,'\thighlight: 0 \r\n');
    fprintf(fid,'\r\n');   
end

fclose(fid);