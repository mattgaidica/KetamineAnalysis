function pieces=findCleanSpans(data,thresh,pieceLength)
    threshIdx=find(abs(data(1,:))>thresh);
    pieces = [];
    for i=1:length(threshIdx)-1
        if(i==1)
            startIdx=1;
            endIdx = threshIdx(i+1);
        else
            startIdx = threshIdx(i);
            endIdx = threshIdx(i+1);
        end
        curRange = endIdx-startIdx;
        
        if(curRange>pieceLength)
            pieces = [pieces;chopItUp(startIdx,endIdx,pieceLength)];
        end
    end
    %showMeWhatHappened(data,pieces);
end

function pieces=chopItUp(startIdx,endIdx,chopSamples)
    pieces = startIdx:chopSamples:endIdx;
    if(length(pieces)>1)
        pieces = pieces(1:end-1)'; %into rows
        pieces(:,2) = pieces(:,1)+(chopSamples-1);
    else
        pieces = [];
    end
end

function showMeWhatHappened(data,pieces)
    figure;
    plot(data);
    
    for i=1:length(pieces)
        hold on;
        plot(pieces(i,1):pieces(i,2),...
            zeros(1,length(pieces(i,1):pieces(i,2))),'r','LineWidth',4);
        plot(pieces(i,1),0,'*','color','k');
    end
end