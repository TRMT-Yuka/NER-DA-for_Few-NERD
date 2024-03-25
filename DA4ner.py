import random
import json
import evaluate

# d= {'tokens': ['The',...,'.'],'tags': ['DT_O',...,'._O'],'tree_pos': ['DT',....'.'], 'ner_pos': ['O',...'O']}
# 交換策辞書作成前の前処理
def make_data2list_Simple(data):
    data_list = []
    for d in data:            
        new_sent = []
        before_tag = ""
        new_token = []
        for i in range(len(d["tags"])):

            if d["ner_pos"][i] == "O" or i == len(d["tokens"])-1:#固有表現タグがO　または　最後のトークンの時
                if d["ner_pos"][i] == before_tag:#1
                    new_token.append(d["tokens"][i])
                    new_sent.append([new_token,d["ner_pos"][i]])
                    new_token = []
                else:
                    new_token = []#2
                    new_token.append(d["tokens"][i])
                    new_sent.append([new_token,d["ner_pos"][i]])
                    new_token = []
                    
            else:#固有表現タグがBI#3
                if d["ner_pos"][i] == before_tag:
                    new_token.append(d["tokens"][i])
                    new_token = []
                else:#4
                    new_token.append(d["tokens"][i])
                    new_sent.append([new_token,d["ner_pos"][i]])
            before_tag = d["ner_pos"][i]
        data_list.append(new_sent)
    return data_list
# dev_list= [['Danish', 'rigsdaler'], 'other-currency'],[['='], 'O'],...



# 交換策辞書作成前の前処理
def make_data2list_TreePos(data):
    data_list = []
    for d in data:            
        new_sent = []
        before_tag = ""
        new_token = []
        new_tag = []
        for i in range(len(d["tags"])):

            if d["ner_pos"][i] == "O" or i == len(d["tokens"])-1:#固有表現タグがO　または　最後のトークンの時
                if d["ner_pos"][i] == before_tag:#1
                    new_token.append(d["tokens"][i])
                    new_tag.append(d["tags"][i])
                    
                    new_tag = list(set(new_tag))  #new_tagの重複削除
                    new_tag.sort()                #new_tagの整列
                    new_sent.append([new_token,"__".join(new_tag)])
                    
                    new_token = []
                    new_tag = []
                else:
                    new_token = []
                    new_tag = []
                    
                    new_token.append(d["tokens"][i])
                    new_tag.append(d["tags"][i])
                    
                    new_tag = list(set(new_tag))  #new_tagの重複削除
                    new_tag.sort()                #new_tagの整列
                    new_sent.append([new_token,"__".join(new_tag)])
                    
                    new_token = []
                    new_tag = []
                    
            else:#固有表現タグがBI
                if d["ner_pos"][i] == before_tag:
                    new_token.append(d["tokens"][i])
                    new_tag.append(d["tags"][i])
                    
                    new_token = []
                    new_tag = []
                else:
                    new_token.append(d["tokens"][i])
                    new_tag.append(d["tags"][i])
                    
                    new_tag = list(set(new_tag))  #new_tagの重複削除
                    new_tag.sort()                #new_tagの整列
                    new_sent.append([new_token,"__".join(new_tag)])#new_tagを__で結合
                    
            before_tag = d["ner_pos"][i]
        data_list.append(new_sent)
    return data_list



#交換先辞書の作成
def make_alterna_labels(data_list):
    label_list = set()
    for s in data_list:
        for t in s:
#             if t[1] != "O" and "_O" not in t[1][0]: #make_alterna_labels_for_Oとの差分
            label_list.add(t[1])
    
    label_list = list(label_list)
    alterna_labels = dict()
    for label in label_list:
        alterna_labels[label] = set()
    for s in data_list:
        for t in s:
            token = "_".join(t[0])
            tag = t[1]
            if tag in label_list:
                alterna_labels[tag].add(token)
    
    new_alterna_labels = dict()
    for k,v in alterna_labels.items():#候補が空白or1つのtagは削除
        if v==set() or len(v) == 1:
            pass
        else:
            new_alterna_labels[k] = v

    return new_alterna_labels



def make_alterna_labels_for_O(data_list):
    label_list = set()
    for s in data_list:
        for t in s:
            if t[1] == "O" or "_O" in t[1][0]:
                label_list.add(t[1])
    
    label_list = list(label_list)
    alterna_labels = dict()
    for label in label_list:
        alterna_labels[label] = set()
    for s in data_list:
        for t in s:
            token = "_".join(t[0])
            tag = t[1]
            if tag in label_list:
                alterna_labels[tag].add(token)
    
    new_alterna_labels = dict()
    for k,v in alterna_labels.items():#候補が空白or1つのtagは削除
        if v==set() or len(v) == 1:
            pass
        else:
            new_alterna_labels[k] = v

    return new_alterna_labels




# 単語をランダムに選択するための関数（Simple_TreePos内部で使用）
def random_choice_token(token_set):
    n = random.randint(0,len(token_set)-1)
    token_list=list(token_set)
    return token_list[n]




# データの拡張と保存
# 配列内辞書形式でjsonから読み込んだデータを拡張し，data/{Simple TreePos}_"+BI_O_ALL+"_small/"+datatype+"_"+str(ver)+".jsonに出力
def Simple_TreePos(datatype,data_dict,BI_O_ALL,ver,parm_exchange,parm_generate_per_s):
    #[[token_1,...token_n],tag],...[token_1,...token_n],tag]]状態のデータを作成
    data_simple = make_data2list_Simple(data_dict)#tagが固有表現情報
    data_treepos = make_data2list_TreePos(data_dict)#tagが品詞＋固有表現情報
    alterna_labels_simple = make_alterna_labels(data_simple)#固有表現情報のみに着目した交換先辞書
    alterna_labels_treepos = make_alterna_labels(data_treepos)#品詞＋固有表現情報の交換先辞書
#     print("make alterna labels")
    #加工箇所を同じにするため，SimpleとTreePosを同時に作成する
    data_simple_f_path = "data/Simple_"+BI_O_ALL+"_small/"+datatype+"_"+str(ver)+".json"
    data_treepos_f_path = "data/TreePos_"+BI_O_ALL+"_small/"+datatype+"_"+str(ver)+".json"
    memo_f_path = "log/TreePos_"+BI_O_ALL+"_small_"+datatype+"_"+str(ver)+"_memo.txt"
#     print("set output file path")
    with open(data_simple_f_path,"w",encoding="utf-8") as data_simple_f, \
    open(data_treepos_f_path,"w",encoding="utf-8") as data_treepos_f, \
    open(memo_f_path,"w",encoding="utf-8") as memo_f:
        
        for i in range(len(data_dict)):
            print('\r%d / %d' %(i, len(data_dict)), end='')
            
            d = data_dict[i]
            write_d = dict()
            print(0)
            write_d["tokens"] = d["tokens"]
            write_d["tags"] = d["ner_pos"]
            print(1)
            data_simple_f.write(json.dumps(write_d))#Simpleにオリジナルデータを先に書込
            data_simple_f.write("\n")
            data_treepos_f.write(json.dumps(write_d))#TreePosにオリジナルデータを先に書込
            data_treepos_f.write("\n")
            
            cnt = 0
            roop_cnt = 0
            while cnt<parm_generate_per_s-1 and roop_cnt<30:
                roop_cnt += 1
                new_d_simple = dict()
                new_d_simple["tokens"] = []
                new_d_simple["tags"] = []

                new_d_treepos = dict()
                new_d_treepos["tokens"] = []
                new_d_treepos["tags"] = []
                old_tokens = []

                sentence_contain_change = False
                
                for token,tag_treepos in data_treepos[i]:
                    tag_simple = tag_treepos.split("_")[-1]
                    old_tokens.extend(token)
                    
                    #固有表現であり，厳格な候補であるtreeposに交換対象が存在するとき，50%の確率で入れ替えを発生
                    if  (tag_treepos in alterna_labels_treepos) and (random.random() >= parm_exchange):
                        if ((BI_O_ALL == "BI") and (tag_simple != "O")) or ((BI_O_ALL == "O") and (tag_simple == "O")) or (BI_O_ALL == "ALL"):

                            #固有表現情報に基づく交換候補を生成
                            token_simple = random_choice_token(alterna_labels_simple[tag_simple]-{"_".join(token)})
                            token_simple = token_simple.split("_")
                            #交換したtokenを記録
                            new_d_simple["tokens"].extend(token_simple)
                            #新しいtokenの数だけtagを追加
                            for _ in token_simple:
                                new_d_simple["tags"].append(tag_simple)

                            #品詞＋固有表現情報に基づく交換候補を生成
                            token_treepos = random_choice_token(alterna_labels_treepos[tag_treepos]-{"_".join(token)})
                            token_treepos = token_treepos.split("_")
                            #交換したtokenを記録
                            new_d_treepos["tokens"].extend(token_treepos)
                            #新しいtokenの数だけtagを追加
                            for _ in token_treepos:#
                                new_d_treepos["tags"].append(tag_simple)
                            sentence_contain_change = True#書換えフラグ

                    else:#交換しない固有表現タグ付きのtoken群（同じタグが連続している場合の人まとまり）
                        new_d_simple["tokens"].extend(token)
                        for _ in token:
                            new_d_simple["tags"].append(tag_simple)

                        new_d_treepos["tokens"].extend(token)
                        for _ in token:
                            new_d_treepos["tags"].append(tag_simple)

                if sentence_contain_change == True:#書換えが実行されたなら現在の一文をデータとして書出（改変前と同じ学習データの混入防止）
                    if (len(new_d_simple["tokens"]) == len(new_d_simple["tags"])) and (len(new_d_treepos["tokens"]) == len(new_d_treepos["tags"])):
                        data_simple_f.write(json.dumps(new_d_simple))
                        data_simple_f.write("\n")
                        data_treepos_f.write(json.dumps(new_d_treepos))
                        data_treepos_f.write("\n")

                        memo_f.write(str(i)+"\t"+" ".join(old_tokens)+"\n")#memoに変更前と変更後を記入
                        memo_f.write(" "*len(str(i))+"\t"+" ".join(new_d_simple["tokens"])+"\n")
                        memo_f.write(" "*len(str(i))+"\t"+" ".join(new_d_treepos["tokens"])+"\n")
                        memo_f.write("\n")
                        cnt+=1
                else:
                    pass
        memo_f.write("sentences augmented!!!! \n")

        
        

#癒着問題解決の為の手動NER関数
def manual_NER_eval(testjson_path,predictionstxt_path):
    references = []
    with open(testjson_path,"r",encoding="utf-8") as f:
        for line in f:
            references.append(json.loads(line)["tags"])

    predictions = []
    with open(predictionstxt_path,"r",encoding="utf-8") as f:
        for line in f:
            predictions.append(line.replace("\n","").split(" "))

    label_set = set()
    for l in references+predictions:
        for label in list(set(l)):
            label_set.add(label)

    label_set.remove("O")
    label_d = dict()
    for k in label_set:
        label_d[k] = "L"+k.replace("/","_").replace("-","_")

    for l in references:
        for i in range(len(l)):
            if l[i] in label_d:
                l[i] = label_d[l[i]]

    for l in predictions:
        for i in range(len(l)):
            if l[i] in label_d:
                l[i] = label_d[l[i]]

    seqeval = evaluate.load('seqeval')
    return seqeval.compute(predictions=predictions, references=references)


def manual_matrix(testjson_path,predictionstxt_path,savecsv_path):
    
    references = []
    with open(testjson_path,"r",encoding="utf-8") as f:
        for line in f:
            references.append(json.loads(line)["tags"])

    predictions = []
    with open(predictionstxt_path,"r",encoding="utf-8") as f:
        for line in f:
            predictions.append(line.replace("\n","").split(" "))

    classes = []
    with open("data/labels.txt","r") as f:
        for line in f:
            classes.append(line.replace("\n",""))

    from sklearn.metrics import confusion_matrix
    val_mat = confusion_matrix(references, predictions, labels=classes)
    
    import numpy
    numpy.savetxt(savecsv_path, val_mat, delimiter=",")