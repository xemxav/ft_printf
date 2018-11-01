# ft_printf
The first project of the algorithm branch of the 42 curriculum.

The project makes a libftprintf.a in order to include it in other project or in our libft.

int ft_printf(const char *s, ...)

My function manages :
	- flags characters :
		- #
		- 0
		- -
	- field width
	- precision
	- length modifier :
		- h, hh
		- l, ll, L
		- z
		- u
	- conversion specifier
		- d, i
		- o, u , x , X
		- c, C
		- s, S
		- p
