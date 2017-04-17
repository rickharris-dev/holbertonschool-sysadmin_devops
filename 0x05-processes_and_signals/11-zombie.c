#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
/**
 * infinite_while - Infinite loop to be run after zombine creation
 *
 * Return: 0 in all cases
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * create_zombie - Creates a single zombie process and outputs pid
 */
void create_zombie(void)
{
	pid_t pid;

	pid = fork();

	if (pid == 0)
	{
		exit(0);
	}

	printf("Zombie process created, PID: %d\n", pid);
}

/**
 * main - Creates 5 zombie processes and then runs an infinite loop
 *
 * Return: integer response from infinite_while function
 */
int main(void)
{
	int i;

	for (i = 0; i < 5; i++)
	{
		create_zombie();
	}
	return (infinite_while());
}
