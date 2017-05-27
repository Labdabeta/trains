#ifndef BUFFER_H
#define BUFFER_H

/* DO NOT directly accesses these fields. Treat this object as opaque! */
typedef struct Buffer {
    void *data;
    size_t data_len;
    int truncated;
} Buffer;

/** Copy one buffer into another.
 *
 * Only copies up to the size of the destination buffer.
 * If fewer bytes are copied, the destination's size is adjusted as necessary.
 *
 * \param[in,out] dst          The destination buffer.
 * \param[in,out] src          The source buffer.
 */
void writeBuffer(Buffer *dst, Buffer *src);
void loadBuffer(Buffer *buf, void *data, size_t len);

#endif /* BUFFER_H */
