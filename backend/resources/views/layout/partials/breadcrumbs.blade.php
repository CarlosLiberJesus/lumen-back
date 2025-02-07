@props(['breadcrumbs'])


<nav aria-label="breadcrumb">
    <ol class="breadcrumb-line my-0 pt-1 breadcrumb">
        @foreach ($breadcrumbs as $breadcrumb)
            <li class="breadcrumb-item">
                @if (!$loop->last)
                    <a tabindex="2" href="{{ $breadcrumb['url'] }}"
                        class="fw-bold text-hover-primary text-muted cursor-pointer">
                        {{ $breadcrumb['label'] }}
                    </a>
                @else
                    <span class="">{{ $breadcrumb['label'] }}</span>
                @endif
            </li>
        @endforeach
    </ol>
</nav>
