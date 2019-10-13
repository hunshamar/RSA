#include "ALU.h"

#include <stdio.h>

enum instructions{
    conditional_subtraction, // If A >= B return A-B, else return A
    left_shift_A,
    left_shift__A_and_add_B,
    return_bit_B_from_A,
    comp_registers_A_B,
    decrement_A,
    increment_A,
    ret_A,
    ret_0,
    ret_1,
    ret_31
};

bool CMP_flag;

void blakelys_algorithm()
{    
    ALU_execute_instruction(0,0,ret_0, &regs.R);
    ALU_execute_instruction(0,0, ret_0, &regs.j);
    ALU_execute_instruction(0,0, ret_31, &regs.T2);
    ALU_execute_instruction(regs.T2, 0, increment_A, &regs.T2);
   
    CMP_flag = ALU_execute_instruction(regs.j, regs.T2, comp_registers_A_B, NULL);

    while(!CMP_flag)
    {  

        CMP_flag = ALU_execute_instruction(regs.a, 31-regs.j, return_bit_B_from_A, NULL);  


        if (CMP_flag){ 
            ALU_execute_instruction(regs.R, regs.b, left_shift__A_and_add_B, &regs.R);
        }
        else
        {
            ALU_execute_instruction(regs.R, 0, left_shift_A, &regs.R);
        }
        

        ALU_execute_instruction(regs.R, regs.n, conditional_subtraction, &regs.R);
        ALU_execute_instruction(regs.R, regs.n, conditional_subtraction, &regs.R);

        ALU_execute_instruction(regs.j, 0, increment_A, &regs.j);
        CMP_flag = ALU_execute_instruction(regs.j, regs.T2, comp_registers_A_B, NULL);   
    }
    ALU_execute_instruction(regs.R, 0, ret_A, &regs.C);
}


void binary_method(){

    
    ALU_execute_instruction(0, 0, ret_31, &regs.i);
    
    CMP_flag = ALU_execute_instruction(regs.ed, regs.i, return_bit_B_from_A, NULL);

    if  (CMP_flag){ // if MSB = 1;
        ALU_execute_instruction(regs.M, 0, ret_A, &regs.C);
    }
    else{
        ALU_execute_instruction(0, 0, ret_1, &regs.C);
    }


    ALU_execute_instruction(0,0, ret_0, &regs.T1); // 30 down to 0

    CMP_flag = ALU_execute_instruction(regs.i, regs.T1, comp_registers_A_B, NULL);

    while(!CMP_flag){
        ALU_execute_instruction(regs.i, 0, decrement_A, &regs.i);

        ALU_execute_instruction(regs.C, 0, ret_A, &regs.a);
        ALU_execute_instruction(regs.C, 0, ret_A, &regs.b);
        blakelys_algorithm();

        CMP_flag = ALU_execute_instruction(regs.ed, regs.i, return_bit_B_from_A, NULL);
        if (CMP_flag){

            ALU_execute_instruction(regs.C, 0, ret_A, &regs.a);
            ALU_execute_instruction(regs.M, 0, ret_A, &regs.b);
            blakelys_algorithm();

        }
        CMP_flag = ALU_execute_instruction(regs.i, regs.T1, comp_registers_A_B, NULL);
    }
}

int main(){
    
   

    // Binary method outputs C = M^e mod n
    // Blakely's method outputs R = a*b mod n

    regs.ed = 17;
    regs.n = 3233; // 61*53
    regs.M = 65; 



    binary_method();

    printf("\nTests: ---------------------------------------------\n");
     printf("test: binary method 19^250 mod 119             =  %d,  should be 2790\n", regs.C);


    regs.ed = 3;
    regs.n = 33; // 11 * 3 
    regs.M = 7; 

        
    binary_method();
     printf("test: binary method 7^3 mod 33                 =  %d,    should be 13\n", regs.C);



    regs.ed = 3;
    regs.n = 25777; // 173 * 149 
    regs.M = 1289; 

    binary_method();
     printf("test: binary method 1289^3 mod 25777           =  %d, should be 18524\n", regs.C);


    regs.ed = 0xffffffff; //4294967295
    regs.n = 25777; // 173 * 149 
    regs.M = 1289; 

    binary_method();
     printf("test: binary method 1289^4294967295 mod 25777  =  %d, should be 24082\n", regs.C);


    return 0;
}