#ifndef __COOKIE_H
#define __COOKIE_H

#include <joedog/joedog.h>
#include <joedog/defs.h>
#include <joedog/boolean.h>

#define MAX_COOKIE_SIZE  4096

typedef struct COOKIE_T *COOKIE;
extern  size_t COOKIESIZE;

COOKIE  new_cookie(char *str, char *host);
COOKIE  cookie_destroy(COOKIE this);

void    cookie_set_name(COOKIE this, char *str);
void    cookie_set_value(COOKIE this, char *str);
void    cookie_reset_value(COOKIE this, char *str);
void    cookie_set_path(COOKIE this, char *str);
void    cookie_set_domain(COOKIE this, char *str);
void    cookie_set_expires(COOKIE this, time_t expires);
char *  cookie_get_name(COOKIE this);
char *  cookie_get_value(COOKIE this);
char *  cookie_get_domain(COOKIE this);
char *  cookie_get_path(COOKIE this);
time_t  cookie_get_expires(COOKIE this);
BOOLEAN cookie_get_session(COOKIE this);
char *  cookie_expires_string(COOKIE this);
char *  cookie_to_string(COOKIE this);
COOKIE  cookie_clone(COOKIE this, COOKIE that);

#endif/*__COOKIE_H*/

