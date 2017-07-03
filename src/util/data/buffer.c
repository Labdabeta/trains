#include "buffer.h"

#ifndef REMOTE
extern void *memcpy(void *dst, const void *src, unsigned int len);
#else
#include <string.h>
#endif

void writeBuffer(Buffer *dst, Buffer *src)
{
	int trunc = dst->data_len < src->data_len;
	size_t smallerSize = (trunc ? dst->data_len : src->data_len);
	memcpy(dst->data, src->data, smallerSize);
	dst->data_len = smallerSize;
	dst->truncated = trunc;
}

void loadBuffer(Buffer *buf, void *data, size_t len)
{
	buf->data = data;
	buf->data_len = len;
	buf->truncated = 0;
}
