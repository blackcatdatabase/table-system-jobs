<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\SystemJobs\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class SystemJobDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly string $jobType,
        public readonly array|null $payload,
        public readonly string $status,
        public readonly int $retries,
        public readonly ?\DateTimeImmutable $scheduledAt,
        public readonly ?\DateTimeImmutable $startedAt,
        public readonly ?\DateTimeImmutable $finishedAt,
        public readonly ?string $error,
        public readonly ?string $uniqueKeyHash,
        public readonly ?string $uniqueKeyVersion,
        public readonly ?\DateTimeImmutable $lockedUntil,
        public readonly ?string $lockedBy,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $updatedAt,
        public readonly int $version
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               // ISO-8601 with a timezone; switch to 'Y-m-d H:i:s.u' if needed
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}
