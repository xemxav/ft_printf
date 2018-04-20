/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   ft_strsplit.c                                    .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: xmoreau <xmoreau@student.42.fr>            +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2017/11/23 15:08:24 by xmoreau      #+#   ##    ##    #+#       */
/*   Updated: 2017/11/23 15:08:26 by xmoreau     ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "libft.h"

static size_t	ft_count_words(char *s, char c)
{
	size_t		count;
	int			in_substring;

	count = 0;
	in_substring = 0;
	while (*s)
	{
		if (in_substring == 1 && *s == c)
			in_substring = 0;
		if (in_substring == 0 && *s != c)
		{
			in_substring = 1;
			count++;
		}
		s++;
	}
	return (count);
}

static size_t	ft_word_len(char *s, char c)
{
	size_t	len;

	len = 0;
	while (*s++ != c)
		len++;
	return (len);
}

char			**ft_strsplit(char const *s, char c)
{
	char	**split;
	size_t	nb_words;
	int		i;

	if (s == NULL)
		return (NULL);
	nb_words = ft_count_words((char *)s, c);
	MALLOC_CHECK(
			(split = (char **)ft_memalloc((nb_words + 1) * sizeof(char *))));
	i = 0;
	while (nb_words--)
	{
		while (*s == c)
			s++;
		split[i] = ft_strsub((char *)s, 0, ft_word_len((char *)s, c));
		MALLOC_CHECK(split[i++]);
		s += ft_word_len((char *)s, c);
	}
	return (split);
}
