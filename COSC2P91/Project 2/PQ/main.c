
#include <stdio.h>
#include <stdlib.h>

struct node { //node for rank and item to traverse list
    int priority;
    int info;
    struct node *link;
} *front = NULL;

void insert(int item, int rank); //call to function
int delete();
int del_all();
void display();
int empty();

int main() {
    int a, item, rank; //a=command
    //creates PQ
    while (1) {
        printf("\nPress 1 to Insert an item into PQ"); //insertion
        printf("\nPress 2 to Remove an item from PQ"); //removal
        printf("\nPress 3 to Delete the PQ"); //purging/ deletes all
        printf("\nPress 4 to Display the items in PQ"); //displays item/rank 
        printf("\nPress 5 to Exit\n"); //quit

        printf("\nEnter command: ");
        scanf("%d", &a);

        switch (a) {
            case 1: //inserts based on rank or priority
                printf("\nEnter item to be inserted: ");
                scanf("%d", &item);
                printf("Enter its rank: ");
                scanf("%d", &rank);
                insert(item, rank);
                break;
            case 2: //removes first item
                printf("\n%d is now Removed\n", delete());
                break;
            case 3: //delete, making it empty/ thrashing contents
                printf("\nPQ is now Deleted\n");
                del_all();
                break;
            case 4: //displays items and prints if empty
                display();
                break;
            case 5: //exit
                exit(1);
            default: //error
                printf("\nError, Enter a new command\n");
        }
    }
}

void insert(int item, int rank) {
    struct node *temp, *p;
    temp = (struct node *) malloc(sizeof (struct node));
    if (temp == NULL) { //insert until end of memory
        printf("\nMemory full\n");
        return;
    }
    temp->info = item;
    temp->priority = rank;
    if (empty() || rank < front->priority) { //if empty or rank is greater than first item
        temp->link = front; //move to the front 
        front = temp;
    } else {
        p = front;
        while (p->link != NULL && p->link->priority <= rank) {
            p = p->link;
        }
        temp->link = p->link;
        p->link = temp;
    }
}

int delete() {
    struct node *temp;
    int item;
    if (empty()) { // if empty
        printf("\nPQ is Empty\n");
        exit(1);
    } else {
        temp = front; //First In First Out
        item = temp->info;
        front = front->link;
        free(temp);
    }
    return item;
}

int empty() {
    if (front == NULL) //NULL if empty
        return 1;
    else
        return 0;
}

int del_all() {
    while (!empty()) { //calls delete until PQ is empty
        delete();
    }
}

void display() {
    struct node *ptr;
    ptr = front;
    if (empty()) { //if empty
        printf("\nPQ is Empty\n");
    } else {
        printf("PQ: \n"); //name of queue
        printf("Rank    Item\n");
        while (ptr != NULL) {
            printf("%3d %7d\n", ptr->priority, ptr->info); //prints item and rank
            ptr = ptr->link;
        }
    }
}