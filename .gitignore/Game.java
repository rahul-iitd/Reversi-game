import java.lang.*;
import java.io.*;
import java.util.*;

public class Game{
    public static char[][] grid=new char[8][8];
    public static boolean check_zero(char[][] c){
        for (int i = 0; i <4 ; i++) {
            for (int j = 0; j < 4; j++) {
                if (c[i][j]=='0') return true;
            }
        }
        return false;
    }

    public static void check_right (char[][] c,int x,int y){
        int flag =0;
        if (y<7) {
            if (c[x][y + 1] == c[x][y] || c[x][y + 1] == '0') return;
            for (int i = y + 1; i <= 7; i++) {
                if (c[x][i] == c[x][y]) {
                    flag = i;
                    break;
                }
            }
            if (flag == 7) return;
            for (int j = y + 1; j < flag; j++) {
                c[x][j] = c[x][y];
            }
        }
        return;
    }



    public static void check_left (char[][] c,int x,int y){
        int flag =0;
        if (y>0) {
            if (c[x][y - 1] == c[x][y]|| c[x][y - 1] == '0') return;
            for (int i = y - 1; i >= 0; i--) {
                if (c[x][i] == c[x][y]) {
                    flag = i;
                    break;
                }

            }
            if (flag == 0) return;
            for (int j = y - 1; j > flag; j--) {
                c[x][j] = c[x][y];
            }
        }
        return;
    }

    public static void check_up (char[][] c,int x,int y){
        int flag =0;
        if (x>0) {
            if (c[x - 1][y] == c[x][y]|| c[x - 1][y] == '0') return;
            for (int i = x - 1; i >= 0; i--) {
                if (c[i][y] == c[x][y]) {
                    flag = i;
                    break;
                }

            }
            if (flag == 0) return;
            for (int j = x - 1; j > flag; j--) {
                c[j][y] = c[x][y];
            }
        }
        return;
    }

    public static void check_down (char[][] c,int x,int y){
        int flag =0;
        if (x<7) {
            if (c[x + 1][y] == c[x][y]|| c[x + 1][y] == '0') return;
            for (int i = x + 1; i <= 7; i++) {
                if (c[i][y] == c[x][y]) {
                    flag = i;
                    break;
                }

            }
            if (flag == 7) return;
            for (int j = x + 1; j < flag; j++) {
                c[j][y] = c[x][y];
            }
        }
        return;
    }

    public static void check_diagonal_up1 (char[][] c,int x,int y){
        int flag =0;
        if (x>0 && y<7) {
            if (c[x - 1][y + 1] == c[x][y]|| c[x - 1][y + 1] == '0') return;
            for (int i = 1; i <= 7; i++) {
                if (x - i > 0 && y + i < 8) {
                    if (c[x - i][y + i] == c[x][y]) {
                        flag = i;
                        break;
                    }
                } else break;
            }
            if (flag == 0) return;
            for (int j = 0; j < flag; j++) {
                c[x - j][y + j] = c[x][y];
            }
        }
        return;
    }

    public static void check_diagonal_dw1 (char[][] c,int x,int y){
        int flag =0;
        if (x<7 && y>0) {
            if (c[x + 1][y - 1] == c[x][y]|| c[x + 1][y - 1] == '0') return;
            for (int i = 1; i <= 7; i++) {
                if (x + i < 8 && y - i > 0) {
                    if (c[x + i][y - i] == c[x][y]) {
                        flag = i;
                        break;
                    }
                } else break;
            }
            if (flag == 0) return;
            for (int j = 0; j < flag; j++) {
                c[x + j][y - j] = c[x][y];
            }
        }
        return;
    }

    public static void check_diagonal_up2 (char[][] c,int x,int y){
        int flag =0;
        if (x>0 && y>0) {
            if (c[x - 1][y - 1] == c[x][y]|| c[x - 1][y - 1] == '0') return;
            for (int i = 1; i <= 7; i++) {
                if (x - i > 0 && y - i > 0) {
                    if (c[x - i][y - i] == c[x][y]) {
                        flag = i;
                        break;
                    }
                } else break;
            }
            if (flag == 0) return;
            for (int j = 0; j < flag; j++) {
                c[x - j][y - j] = c[x][y];
            }
        }
        return;
    }

    public static void check_diagonal_dw2 (char[][] c,int x,int y){
        int flag =0;
        if (x<7 && y<7) {
            if (c[x + 1][y + 1] == c[x][y]|| c[x + 1][y + 1] == '0') return;
            for (int i = 1; i <= 7; i++) {
                if (x + i < 8 && y + i < 8) {
                    if (c[x + i][y + i] == c[x][y]) {
                        flag = i;
                        break;
                    }
                } else break;
            }
            if (flag == 0) return;
            for (int j = 0; j < flag; j++) {
                c[x + j][y + j] = c[x][y];
            }
        }
        return;
    }


    public static void print(char[][] c){
        for (int i = 0; i <8; i++) {
            for (int j = 0; j <8 ; j++) {
                System.out.print(c[i][j]);
                System.out.print("  ");
            }
            System.out.println("\n");
        }
    }
    public static void main (String args[]){
        for (int i = 0; i <8; i++) {
            for (int j = 0; j < 8; j++) {
                 grid[i][j]='0';
            }
        }
        grid[3][3]='w';grid[4][4]='w';grid[3][4]='b';grid[4][3]='b';
        while (check_zero(grid)){
            Scanner x=new Scanner(System.in);
            String s=x.next();
            int m=(int)(s.charAt(0))-48;
            int n=(int)(s.charAt(1))-48;
            char a=s.charAt(2);
            grid[m][n]=a;
            check_diagonal_up1(grid,m,n);
            check_diagonal_up2(grid,m,n);
            check_diagonal_dw1(grid,m,n);
            check_diagonal_dw2(grid,m,n);
            check_left(grid,m,n);
            check_right(grid,m,n);
            check_up(grid,m,n);
            check_down(grid,m,n);
            print(grid);
        }

    }

}
