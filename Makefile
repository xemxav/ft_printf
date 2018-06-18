# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: xmoreau <xmoreau@student.le-101.fr>        +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/03 15:16:05 by xmoreau      #+#   ##    ##    #+#        #
#    Updated: 2018/05/14 14:46:51 by xmoreau     ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

CC = gcc

CFLAGS = -Wall -Werror -Wextra

NAME = libftprintf.a

HEADER = ./includes/ft_printf.h

OBJS = ./srcs/ft_printf.o \
		./srcs/struct_management.o \
		./srcs/flag_parsing2.o \
		./srcs/start_processing.o \
		./srcs/processing.o \
		./srcs/itoa_base_s.o \
		./srcs/itoa_base_u.o \
		./srcs/trees.o \
		./srcs/make_s_c.o \
		./srcs/width.o \
		./srcs/make_flags.o \
		./srcs/precision.o \
		./srcs/run_big_s.o \
		./srcs/run_big_c.o \
		./srcs/width_for_chr.o \
		./srcs/fd_printf.o \

all: $(NAME)

$(NAME) : $(OBJS)
	make -C libft
	cp libft/libft.a ./$(NAME)
	ar rcs $(NAME) $(OBJS)

./%.o: ./%.c
	@$(CC) $(FLAGS) -I $(HEADER) -o $@ -c $<

clean:
	rm -rf $(OBJS)
	make -C libft clean

fclean: clean
	make -C libft fclean
	rm -rf $(NAME)
	rm -rf $(OBJS)

re: fclean all

.PHONY: all clean fclean re
