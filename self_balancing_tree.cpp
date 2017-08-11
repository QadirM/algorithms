* Node is defined as :
typedef struct node
{
    int val;
    struct node* left;
    struct node* right;
    int ht;
} node; */
int getHt(node* el){
    if (el==NULL){
        return 0;
    }
    return el->ht;
}

void calculateHt(node* el){
    if (el->left==NULL && el->right==NULL){
        el->ht = 0;
    }
    else
    {
        int lh = getHt(el->left);
        int rh = getHt(el->right);
        el->ht = (lh>rh?lh:rh)+1;
    }
}

int getBalanceFactor(node* el){
    return getHt(el->left)+(el->left==NULL?0:1) - getHt(el->right)-(el->right==NULL?0:1);
}


node* rotateLeft(node* parent, node* root){
    node* rotationRoot = parent->right;
    parent->right = rotationRoot->left;
    rotationRoot->left = parent;
    return rotationRoot;
}

node* rotateRight(node* parent, node* root){
    node* rotationRoot = parent->left;
    parent->left = rotationRoot->right;
    rotationRoot->right = parent;
    return rotationRoot;
}

node* rotate(node* parent, node* root, bool leftRotation)
{
    node* rotationRoot = leftRotation
            ? rotateLeft(parent, root)
            : rotateRight(parent,root);
    calculateHt(parent);
    calculateHt(rotationRoot);
    if (root!=NULL)
    {
        if (root->left==parent){
            root->left = rotationRoot;
        }
        else{
            root->right = rotationRoot;
        }
        calculateHt(root);
    }
    return rotationRoot;
}

node* rebalance(vector<node*>& path)
{
    int index = path.size()-1;
    node* root = path[0];
    while(index>0) {
        node* N = path[index];
        node* P = path[index-1];
        bool isLeftChild = N == P->left;
        if (getBalanceFactor(P) == (isLeftChild?2:-2)) {
            if (getBalanceFactor(N) == (isLeftChild?-1:1)) {
                rotate(N,P, isLeftChild);
            }
            node* PP =index>=2? path[index-2]:NULL;
            node* possibleRoot = rotate(P, PP, !isLeftChild);
            if (PP==NULL){
                root = possibleRoot;
            }
            break;
        }
        if (getBalanceFactor(P) == (isLeftChild?-2:2)) {
            break;
        }
        index--;
    };
    while(index>0) {
        calculateHt(path[--index]);
    }
    return root;
}

void insert(node* current, node* newNode, vector<node*>& path){
    bool increaseHt = current->ht==0;
    if(current->val>newNode->val){
        current->left = newNode;
    }
    else{
        current->right = newNode;
    }
    for (int i =path.size()-1;i>=0;i--){
        calculateHt(path[i]);
    }
    path.push_back(newNode);
}

node* find(vector<node*>& path, node* newNode)
{
    node* current;
    while(1)
    {
        current = path[path.size()-1];
        node* insertElement = current->val>newNode->val?current->left:current->right;
        if (insertElement==NULL){
            break;
        }
        path.push_back(insertElement);
    }
    return current;
}

node* insert(node * root,int val)
{
    vector<node*> path;
    path.push_back(root);
    node* newNode = new node();
    newNode->val = val;
    node* current=find(path, newNode);
    insert(current,newNode, path);
    node* a= rebalance(path);
    return a;
}
