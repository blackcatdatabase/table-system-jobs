<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\SystemJobs\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class SystemJobDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $jobType,
        public readonly array|null $payload,
        public readonly string $status,
        public readonly int $retries,
        public readonly ?\DateTimeImmutable $scheduledAt,
        public readonly ?\DateTimeImmutable $startedAt,
        public readonly ?\DateTimeImmutable $finishedAt,
        public readonly ?string $error,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $updatedAt,
        public readonly int $version
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
